<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Task Manager</title>
</head>
<body>
<h2>Task List</h2>

<form action="/view/tasks" method="post">
    Title: <input type="text" name="title" required />
    Description: <input type="text" name="description" required />
    Completed: <input type="checkbox" name="completed" />
    <input type="submit" value="Add Task" />
</form>

<table border="1" cellpadding="6" cellspacing="0">
    <tr><th>ID</th><th>Title</th><th>Description</th><th>Completed</th><th>Actions</th></tr>
    <c:forEach var="task" items="${tasks}">
        <tr>
            <td>${task.id}</td>
            <td>${task.title}</td>
            <td>${task.description}</td>
            <td><c:out value="${task.completed ? 'Yes' : 'No'}"/></td>
            <td>
                <a href="/view/tasks/edit/${task.id}">Edit</a> |
                <a href="/view/tasks/delete/${task.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
