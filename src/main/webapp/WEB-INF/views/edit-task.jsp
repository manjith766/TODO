<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Edit Task</title>
</head>
<body>
<h2>Edit Task</h2>

<form action="/view/tasks/update/${task.id}" method="post">
    Title: <input type="text" name="title" value="${task.title}" required /><br/><br/>
    Description: <input type="text" name="description" value="${task.description}" required /><br/><br/>
    Completed: <input type="checkbox" name="completed" <c:if test="${task.completed}">checked</c:if> /><br/><br/>
    <input type="submit" value="Update" />
    <a href="/view/tasks">Cancel</a>
</form>

</body>
</html>
