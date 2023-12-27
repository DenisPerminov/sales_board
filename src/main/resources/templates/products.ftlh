<!DOCTYPE html>
<html>
<head>
<title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Выйти"/>
    </form>
    <a href="/user/${user.id}">Мои товары</a><hr>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a><hr>
</#if>
<h4>Товары со всей России</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title"/><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>
<#if user.email??>
    <hr>
    <form action="/product-add" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>
</body>
</html>