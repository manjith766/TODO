package com.neoteric.controller;

import com.neoteric.model.Task;
import com.neoteric.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/view/tasks")
public class TaskViewController {

    private final TaskService service;

    public TaskViewController(TaskService service) {
        this.service = service;
    }

    @GetMapping
    public String listTasks(Model model) {
        model.addAttribute("tasks", service.getAllTasks());
        model.addAttribute("task", new Task());
        return "tasks";
    }

    @PostMapping
    public String createTask(@ModelAttribute Task task) {
        service.createTask(task);
        return "redirect:/view/tasks";
    }

    @GetMapping("/edit/{id}")
    public String editTask(@PathVariable Long id, Model model) {
        Task task = service.getTaskById(id).orElseThrow(() -> new RuntimeException("Task not found"));
        model.addAttribute("task", task);
        return "edit-task";
    }

    @PostMapping("/update/{id}")
    public String updateTask(@PathVariable Long id, @ModelAttribute Task task) {
        service.updateTask(id, task);
        return "redirect:/view/tasks";
    }

    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        service.deleteTask(id);
        return "redirect:/view/tasks";
    }
}
