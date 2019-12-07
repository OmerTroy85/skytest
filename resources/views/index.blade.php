@extends('layouts.app')

@section('content')
<div class="container">
    <div class="jumbotron text-center">
        <h3 class="display-3">
            Manage Users
        </h3>
        <div class="row mt-5">
            @if(Auth::guard('admin')->check())
                <div class="col-4">
                    <input type="button" class="btn btn-lg btn-primary" value="Add User">
                </div>
                <div class="col-4">
                    <input type="button" class="btn btn-lg btn-success" value="Add Admin">
                </div>
                <div class="col-4">
                    <input type="button" class="btn btn-lg btn-warning" value="Add Blogger">
                </div>

            @elseif(Auth::guard('blogger')->check())
                <div class="col-4">
                    <input type="button" class="btn btn-lg btn-primary" value="Add Blog">
                </div>
                <div class="col-4">
                    <input type="button" class="btn btn-lg btn-warning" value="Add Blogger">
                </div>

                @else
                    <div class="col-4">
                        <input type="button" class="btn btn-lg btn-primary" value="Add User">
                    </div>
                    <div class="col-4">
                        <input type="button" class="btn btn-lg btn-warning" value="Add Blogger">
                    </div>
            @endif

        </div>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Users</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Admins</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages" role="tab" aria-controls="messages" aria-selected="false">Bloggers</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content p-4">
        <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <table id="usersTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                @isset($users)
                    @foreach($users as $user)
                        <tr>
                            <td>{{$user['id']}}</td>
                            <td>{{$user['name']}}</td>
                            <td>{{$user['email']}}</td>
                            <td>{{$user['created_at']}}</td>
                            <td><a href="{{route('user.edit', $user['id'])}}" class="btn btn-info">Edit</a></td>
                            <td><a href="{{route('user.delete', $user['id'])}}" class="btn btn-danger">Delete</a></td>
                        </tr>
                    @endforeach
                @endisset
                </tbody>
                <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <table id="adminsTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                @isset($admins)
                    @foreach($admins as $admin)
                        <tr>
                            <td>{{$admin['id']}}</td>
                            <td>{{$admin['name']}}</td>
                            <td>{{$admin['email']}}</td>
                            <td>{{$admin['created_at']}}</td>
                            <td><a href="{{route('admin.edit', $admin['id'])}}" class="btn btn-info">Edit</a></td>
                            <td><a href="{{route('admin.delete', $admin['id'])}}" class="btn btn-danger">Delete</a></td>
                        </tr>
                    @endforeach
                @endisset
                </tbody>
                <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">
            <table id="bloggersTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                @isset($bloggers)
                    @foreach($bloggers as $blogger)
                        <tr>
                            <td>{{$blogger['id']}}</td>
                            <td>{{$blogger['name']}}</td>
                            <td>{{$blogger['email']}}</td>
                            <td>{{$blogger['created_at']}}</td>
                            <td><a href="{{route('blogger.edit', $blogger['id'])}}" class="btn btn-info">Edit</a></td>
                            <td><a href="{{route('blogger.delete', $blogger['id'])}}" class="btn btn-danger">Delete</a></td>
                        </tr>
                    @endforeach
                @endisset
                </tbody>
                <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
@endsection


