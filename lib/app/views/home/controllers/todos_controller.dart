import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/networking_managar.dart';
import '../../../../core/utils/utils.dart';
import '../models/todos_model.dart';

class TodosScreenController extends GetxController {
  var isLoading = false.obs;
  RxBool isOtpSent = true.obs;

  // Observable list to store todos
  RxList<TodoModel> todoList = <TodoModel>[].obs;

  // Observable for filtered todos
  RxList<TodoModel> filteredTodos = <TodoModel>[].obs;

  // Observable for current filter
  RxString currentFilter = 'all'.obs; // 'all', 'completed', 'pending'

  TextEditingController phoneController = TextEditingController();

  Future<void> getTodos() async {
    Utils.printData("Insdie todo api");
    try {
      isLoading.value = true;

      dio.Response? response = await NetworkManager().callApi(
        method: HttpMethod.get,
        urlEndPoint: ApiEndpoints.getData,
        isFormDataRequest: false, // Changed to false since it's a GET request
      );

      if (response != null && response.statusCode == 200) {
        // Handle the response data
        await _handleTodosResponse(response.data);
      } else {
        Utils.toastMessage("Failed to fetch todos");
      }
    } catch (e) {
      Utils.toastMessage("Failed to load todos");
      print("Error fetching todos: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _handleTodosResponse(dynamic responseData) async {
    try {
      // Clear existing todos
      todoList.clear();

      // Check if response is a List
      if (responseData is List) {
        // Parse each item in the list
        for (var item in responseData) {
          if (item is Map<String, dynamic>) {
            TodoModel todo = TodoModel.fromJson(item);
            todoList.add(todo);
          }
        }

        // Apply current filter
        _applyFilter();

        Utils.toastMessage("${todoList.length} todos loaded successfully");
      } else {
        Utils.toastMessage("Invalid response format");
      }
    } catch (e) {
      Utils.toastMessage("Error parsing todos data");
      print("Error parsing todos: $e");
    }
  }

  // Filter todos based on completion status
  void filterTodos(String filter) {
    currentFilter.value = filter;
    _applyFilter();
  }

  void _applyFilter() {
    switch (currentFilter.value) {
      case 'completed':
        filteredTodos.value = todoList.where((todo) => todo.completed).toList();
        break;
      case 'pending':
        filteredTodos.value =
            todoList.where((todo) => !todo.completed).toList();
        break;
      case 'all':
      default:
        filteredTodos.value = todoList.toList();
        break;
    }
  }

  // Toggle todo completion status
  void toggleTodoCompletion(int todoId) {
    int index = todoList.indexWhere((todo) => todo.id == todoId);
    if (index != -1) {
      TodoModel updatedTodo = todoList[index].copyWith(
        completed: !todoList[index].completed,
      );
      todoList[index] = updatedTodo;
      _applyFilter(); // Refresh filtered list
    }
  }

  // Get todos by user ID
  List<TodoModel> getTodosByUserId(int userId) {
    return todoList.where((todo) => todo.userId == userId).toList();
  }

  // Get completed todos count
  int get completedTodosCount {
    return todoList.where((todo) => todo.completed).length;
  }

  // Get pending todos count
  int get pendingTodosCount {
    return todoList.where((todo) => !todo.completed).length;
  }

  // Search todos by title
  void searchTodos(String query) {
    if (query.isEmpty) {
      _applyFilter();
    } else {
      filteredTodos.value =
          todoList
              .where(
                (todo) =>
                    todo.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
  }

  // Refresh todos
  Future<void> refreshTodos() async {
    await getTodos();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
