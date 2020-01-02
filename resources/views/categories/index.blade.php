@extends('layouts.global')

@section('title')
    Category list
@endsection

@section('content') 
<div class="row">

    <div class="col-md-6">
        <form action="{{route('categories.index')}}">
  
          <div class="input-group">
              <input 
                type="text" 
                class="form-control" 
                placeholder="Filter by category name"
                value="{{Request::get('name')}}"
                name="name">
  
              <div class="input-group-append">
                <input 
                  type="submit" 
                  value="Filter" 
                  class="btn btn-primary">
              </div>
          </div>
  
        </form>
      </div>
  
      <div class="col-md-3">
        <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
            <a class="nav-link active" href="{{route('categories.index')}}">Published</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{route('categories.trash')}}">Trash</a>
          </li>
        </ul>
      </div>
      
    <div class="col-md-3 text-right">
        <a href="{{route('categories.create')}}" class="btn btn-primary btn-sm">Create category</a>
    </div>
 
     <hr class="my-4">
 

    @if(session('status'))
        <div class="col-md-6 mt-3">
            <div class="alert alert-warning">
                {{session('status')}}
            </div>
        </div>
    @endif

        <div class="col-md-12 mt-1">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th><b>Name</b></th>
                        <th><b>Slug</b></th>
                        <th><b>Image</b></th>
                        <th><b>Actions</b></th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($categories as $category)
                    <tr>
                        <td>{{$category->name}}</td>
                        <td>{{$category->slug}}</td>
                        <td class="text-center">
                            @if ($category->image)
                                <img
                                src="{{asset('storage/'.$category->image)}}"
                                width="72px" />
                            @else
                                No Image
                            @endif
                        </td>
                        <td class="text-center">
                        <a href="{{route('categories.edit', [$category->id])}}" class="btn btn-info btn-sm">Edit</a>
                        <a href="{{route('categories.show', [$category->id])}}" class="btn btn-primary btn-sm">Show</a>
                        <form 
                            class="d-inline"
                            action="{{route('categories.destroy', [$category->id])}}"
                            method="POST"
                            onsubmit="return confirm('Move category to trash?')"
                            >

                            @csrf 

                            <input 
                                type="hidden" 
                                value="DELETE" 
                                name="_method">

                            <input 
                                type="submit" 
                                class="btn btn-danger btn-sm" 
                                value="Trash">

                        </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td>
                            {{$categories->appends(Request::all())->links()}}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
@endsection