## Sky Test

### Database
Sql file is included. You can also run php artisan migrate to create db from scratch
```command
php artisan migrate
```

### Demo accounts
#### User
```command
    umar@test.com
    123456789
```

#### Admin
```command
    umaradmin@test.com
    12345678
```

#### Blogger
```command
    umarblogger@test.com
    12345678
```

### Working
Three types of users are able to log in the system. Admins can maniuplate records of all three types. User can manipulate bloggers information and bloggers can only add blogs. 

### Features
1. Authentication system through ajax and passport. Routes are defined in web and api.php
2. CRUD through ajax.
3. Datatables implemented. 
4. Auth implemented. 

### Note
Some features are missing.
1. route restriction and redirection. (every feature is done through ajax request so these additional features couldnt be implemented due to lack of time)
2. Adding new records.
3. Registering new users (not in requirements but it is a fundamental part of every application)

