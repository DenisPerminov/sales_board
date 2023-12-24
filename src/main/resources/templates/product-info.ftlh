<!DOCTYPE html>
<html>
<head>
<title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1><hr>
<h4>Подробная информация о товаре</h4>
<#list pictures as pic>
    <img src="/pictures/${pic.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b><a href="/user/${product.user.id}">${product.user.name}</a><br>
</body>
</html>