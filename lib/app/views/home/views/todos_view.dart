import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todos_controller.dart';
import '../models/todos_model.dart';

class TodoListWidget extends StatelessWidget {
  final controller = Get.put(TodosScreenController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.todoList.isEmpty) {
        controller.getTodos();
      }
    });
    return Scaffold(
      body: Column(
        children: [
          // Filter buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => ElevatedButton(
                  onPressed: () => controller.filterTodos('all'),
                  child: Text('All (${controller.todoList.length})'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.currentFilter.value == 'all'
                            ? Colors.blue
                            : Colors.grey,
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () => controller.filterTodos('completed'),
                  child: Text('Completed (${controller.completedTodosCount})'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.currentFilter.value == 'completed'
                            ? Colors.green
                            : Colors.grey,
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () => controller.filterTodos('pending'),
                  child: Text('Pending (${controller.pendingTodosCount})'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.currentFilter.value == 'pending'
                            ? Colors.orange
                            : Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          // Todo list
          Expanded(
            child: Obx(() {
              if (controller.filteredTodos.isEmpty) {
                return Center(
                  child: Text(
                    'No todos found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.refreshTodos,
                child: ListView.builder(
                  itemCount: controller.filteredTodos.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = controller.filteredTodos[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: Checkbox(
                          value: todo.completed,
                          onChanged: (value) {
                            controller.toggleTodoCompletion(todo.id);
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                            color: todo.completed ? Colors.grey : Colors.black,
                          ),
                        ),
                        subtitle: Text('User ID: ${todo.userId}'),
                        trailing: Icon(
                          todo.completed
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: todo.completed ? Colors.green : Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
