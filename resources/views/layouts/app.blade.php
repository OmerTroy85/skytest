<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <script src="{{ asset('js/DataTables/datatables.js') }}"></script>

    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
{{--    <link href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">--}}

<!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('js/DataTables/datatables.css') }}" rel="stylesheet">

</head>
<body>
<div id="app">
    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">
                {{ config('app.name', 'Laravel') }}
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="{{ __('Toggle navigation') }}">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mr-auto">

                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Authentication Links -->
                    @guest
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                        </li>
                        @if (Route::has('register'))
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                            </li>
                        @endif
                    @else
                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                      style="display: none;">
                                    @csrf
                                </form>
                            </div>
                        </li>
                    @endguest
                </ul>
            </div>
        </div>
    </nav>

    <main class="py-4">
        @yield('content')
    </main>
</div>

<div class="modal text-white" tabindex="-1" role="dialog" id="errorModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-danger">
            <div class="modal-header">
                <h5 class="modal-title">Error Occured</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>An error has occurred. Kindly check your enetered details and try again</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        jQuery.noConflict();
        $('#usersTable').DataTable();
        $('#adminsTable').DataTable();
        $('#bloggersTable').DataTable();
    });

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var base_url = '';

    // For getting base url in javascript, *NOTE* if you make changes in htaccess file and remove public from url, just remove the 'public/' from base url variable down below
    function get_base_url() {
        var pathparts = location.pathname.split('/');
        var url = '';
        if (location.host == 'localhost') {
            url = location.origin + '/' + pathparts[1].trim('/') + '/';
        } else {
            url = location.origin;
        }
        base_url = url + 'public/';
        return base_url;
    }

    function loginUser() {
        var emailField = document.getElementById('email').value;
        var passwordField = document.getElementById('password').value;

        var objToSend = {
            'email': emailField,
            'password': passwordField
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('user.login')}}',
            'data': objToSend,
            'success': function (response) {
                // console.log(response);
                if (response.status == '200') {
                    window.location = get_base_url() + 'index';
                } else {
                    if (typeof response.error !== 'undefined') {
                        $('#errorModal').modal('toggle');
                    }
                }
            }
        });
    }

    function loginAdmin() {
        var emailField = document.getElementById('emailAdmin').value;
        var passwordField = document.getElementById('passwordAdmin').value;

        var objToSend = {
            'email': emailField,
            'password': passwordField
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('admin.login')}}',
            'data': objToSend,
            'success': function (response) {
                if (response.status == '200') {
                    window.location = get_base_url() + 'index';
                } else {
                    if (typeof response.error !== 'undefined') {
                        $('#errorModal').modal('toggle');
                    }
                }
            }
        });
    }

    function loginBlogger() {
        var emailField = document.getElementById('emailBlogger').value;
        var passwordField = document.getElementById('passwordBlogger').value;

        var objToSend = {
            'email': emailField,
            'password': passwordField
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('blogger.login')}}',
            'data': objToSend,
            'success': function (response) {
                // console.log(response);
                if (response.status == '200') {
                    window.location = get_base_url() + 'index';
                } else {
                    if (typeof response.error !== 'undefined') {
                        $('#errorModal').modal('toggle');
                    }
                }
            }
        });
    }

    function editUser() {
        var id = document.getElementById('userId').value;
        var name = document.getElementById('userName').value;
        var email = document.getElementById('userEmail').value;
        var password = document.getElementById('userPassword').value;

        var objToSend = {
            'id': id,
            'name': name,
            'email': email,
            'password': password,
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('user.edited')}}',
            'data': objToSend,
            'success': function (response) {
                console.log(response);
                if (response == 'Updated successfully') {
                    window.location = get_base_url() + 'index';
                } else {
                    $('#errorModal').modal('toggle');
                }
            }
        });
    }

    function editAdmin() {
        var id = document.getElementById('adminId').value;
        var name = document.getElementById('adminName').value;
        var email = document.getElementById('adminEmail').value;
        var password = document.getElementById('adminPassword').value;

        var objToSend = {
            'id': id,
            'name': name,
            'email': email,
            'password': password,
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('admin.edited')}}',
            'data': objToSend,
            'success': function (response) {
                console.log(response);
                if (response == 'Updated successfully') {
                    window.location = get_base_url() + 'index';
                } else {
                    $('#errorModal').modal('toggle');
                }
            }
        });
    }

    function editBlogger() {
        var id = document.getElementById('bloggerId').value;
        var name = document.getElementById('bloggerName').value;
        var email = document.getElementById('bloggerEmail').value;
        var password = document.getElementById('bloggerPassword').value;

        var objToSend = {
            'id': id,
            'name': name,
            'email': email,
            'password': password,
        };

        $.ajax({
            'type': 'POST',
            'url': '{{route('blogger.edited')}}',
            'data': objToSend,
            'success': function (response) {
                console.log(response);
                if (response == 'Updated successfully') {
                    window.location = get_base_url() + 'index';
                } else {
                    $('#errorModal').modal('toggle');
                }
            }
        });
    }

</script>
</body>
</html>
