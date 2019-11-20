@extends('layouts.global')

@section('title')
    Users list
@endsection

@section('content')

        
        <div class="col-md-4 pl-3 mb-3 mx-right">
        <form action="{{route('users.index')}}">
            <input value="{{Request::get('keyword')}}" name="keyword" class="form-control" type="text" placeholder="Masukan email untuk filter..."/>
        </div>
        <div class="col-md-3 pl-3 mb-3 mx-left">
            <input {{Request::get('status') == 'ACTIVE' ? 'checked' : ''}} value="ACTIVE" name="status" type="radio" class="form-control" id="active">
            <label for="active">Active</label>
            <input {{Request::get('status') == 'INACTIVE' ? 'checked' : ''}} value="INACTIVE" name="status" type="radio" class="form-control" id="inactive">
            <label for="inactive">Inactive</label>
            <button type="submit" value="Filter" class="btn btn-primary btn-sm">Filter</button>    
        </form>    
        </div>
        <div class="col-md-5 pl-3 mb-3 text-right">
                <a 
                href="{{route('users.create')}}" 
                class="btn btn-success">Create user</a>
        </div>
        

        
           
    <div class="col-md-12">
    <table class="table table-bordered table-striped table-hover">
        <thead class="thead-light text-center">
            <tr>
                <th><b>Name</b></th>
                <th><b>Username</b></th>
                <th><b>Email</b></th>
                <th><b>Avatar</b></th>
                <th><b>Status</b></th>
                <th><b>Action</b></th>
            </tr>
        </thead>
        <tbody>
          @foreach ($users as $user)
            <tr>
                <td>{{ $user->name }}</td>
                <td>{{ $user->username }}</td>
                <td>{{$user->email}}</td>
                <td class="text-center">@if ($user->avatar)
                        <img src="{{ asset('storage/'.$user->avatar)}}" width="70px"/>
                    @else
                        N/A
                    @endif
                </td>
                <td>
                    @if ($user->status == "ACTIVE")
                        <span class="badge badge-success">
                            {{$user->status}}
                        </span>
                    @else 
                        <span class="badge badge-danger">
                            {{$user->status}}
                        </span>
                    @endif
                </td>
                <td class="text-center">
                    <a class="btn btn-info btn-sm" href="{{route('users.edit', [$user->id])}}">Edit</a>
                    <form onsubmit="return confirm('delete this username permanently?')" class="d-inline" action="{{route('users.destroy', [$user->id])}}" method="POST">
                        @csrf
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                    </form>
                    <a href="{{route('users.show',[$user->id])}}" class="btn btn-primary btn-sm">Detail</a>
                </td>
            </tr>
          @endforeach
        </tbody>
    </table>
</div>

@endsection