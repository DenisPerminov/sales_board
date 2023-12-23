<!DOCTYPE html>
<html>
<head>
<title>SalesBoard</title>
</head>
<body>
<h1>SalesBoard</h1><hr>
<a href="/">На главную страницу</a><hr>
<h4>Подробная информация о товаре</h4>
<#list pictures as pic>
    <img src="/pictures/${pic.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b>${product.user.name}<br>
<b>Номер телефона: </b>${product.user.phoneNumber}<br>
</body>
</html>