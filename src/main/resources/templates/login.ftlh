<!DOCTYPE html>

<html>
<head>
<title>SalesBoard</title>
</head>
<body>
<h1><a href="/">SalesBoard</a></h1><hr>
<a href="/">На главную страницу</a><hr>
<h4>Авторизация</h4>
<form action="/login" method="post">
    Эл. почта: <input type="email" name="username"/><br><br>
    Пароль: <input type="password" name="password"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>