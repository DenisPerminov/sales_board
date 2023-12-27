<!DOCTYPE html>
<html>
<head>
    <title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1>
<hr>
<h4>Панель администратора</h4>
<table border="1">
    <tr>
        <th>Имя</th>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Блок</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.name}</th>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>Активен<#else>Блокирован</#if></th>
            <th><#list user.roles as role>
                    ${role}<#sep>,
                </#list>
            </th>
            <th>
                <form action="/admin/user/block/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="submit" value="Блок"/>
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
            <th><a href="/user/${user.id}">Подробная информация</a></th>
        </tr>
        <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</body>
</html>