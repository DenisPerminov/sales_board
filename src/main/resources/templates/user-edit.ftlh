<!DOCTYPE html>
<html>
<head>
    <title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1><hr>
<h3>Резактирование пользователя ${user.name}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Сохранить"/>
</form>
</body>
</html>