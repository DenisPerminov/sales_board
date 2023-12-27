<!DOCTYPE html>

<html>
<head>
    <title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1><hr>
<h4>Добавление нового товара</h4>
<form action="product/create" method="post" enctype="multipart/form-data">
    Название объявления: <input type="text" name="title"/><br><br>
    Описание объявления: <input type="text" name="description"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Город: <input type="text" name="city"/><br><br>
    Первая картинка: <input type="file" name="file1"/><br><br>
    Вторая картинка: <input type="file" name="file2"/><br><br>
    Третья картинка: <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Добавить товар"/>
</form>
</body>
</html>