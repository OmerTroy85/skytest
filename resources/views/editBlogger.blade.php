@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-4">
                @isset($user)
                    <input type="hidden" id="bloggerId" value="{{$user['id']}}">
                    <div class="form-group">
                        <label> Name: </label>
                        <input type="text" class="form-control" id="bloggerName" value="{{$user['name']}}">
                    </div>

                    <div class="form-group">
                        <label> Email: </label>
                        <input type="text" class="form-control" id="bloggerEmail" value="{{$user['email']}}">
                    </div>

                    <div class="form-group">
                        <label> New Password: </label>
                        <input type="text" class="form-control" id="bloggerPassword" value="">
                    </div>

                    <a href="#" class="btn btn-primary" onclick="event.preventDefault(); editBlogger()">Edit Blogger</a>
                @endisset
            </div>
        </div>

    </div>
@endsection
