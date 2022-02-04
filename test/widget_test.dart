import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ingreso/models/post.dart';
import 'package:prueba_ingreso/models/user/user.dart';
import 'mock_post/bloc/mock_post_bloc.dart';
import 'mock_post/bloc/mock_post_event.dart';
import 'mock_post/bloc/mock_post_repository.dart';
import 'mock_post/bloc/mock_post_state.dart';
import 'mock_user/bloc/mock_user_bloc.dart';
import 'mock_user/bloc/mock_user_event.dart';
import 'mock_user/bloc/mock_user_repository.dart';
import 'mock_user/bloc/mock_user_state.dart';

void main() {
  group('Bloc test',(){
    late MockUserBloc mockUserBloc;
    MockUserRepository mockUserRepository;
    late MockPostBloc mockPostBloc;
    MockPostRepository mockPostRepository;

    setUp((){
      EquatableConfig.stringify = true;
      mockUserRepository = MockUserRepository();
      mockUserBloc = MockUserBloc(mockUserRepository);
      mockPostRepository = MockPostRepository();
      mockPostBloc = MockPostBloc(mockPostRepository);
    });

    blocTest<MockUserBloc, MockUserState>(
      'Obtener todos los usuarios', 
      build: ()=> mockUserBloc,
      act: (bloc)=> bloc.add(const AppStarted()),
      expect: ()=>[
        UserLoading(),
        FindUsers(mockUsers)
      ]
    );

    blocTest<MockUserBloc, MockUserState>(
      'Buscar por nombre', 
      build: ()=> mockUserBloc,
      act: (bloc)=> bloc.add(const SearchUserByName(name: "test 1")),
      expect: ()=>[
        UserLoading(),
        FindUsers( <User>  [
          User(id: 9, name:"test 9",  userName: "test 9", email: "test9@gmail.com", phone:"+504 3344-4432", website: "test9.com")
          ]
        )
      ]
    );

    blocTest<MockPostBloc, MockPostState>(
      'buscar por userId', 
      build: ()=> mockPostBloc,
      act: (bloc)=> bloc.add(const GetPostByUserId(userId: 7)),
      expect: ()=>[
        PostLoading(),
        FindPosts(posts: <Post>[
            Post(id: 1, userId:7, title: "lorem", body: "lorem impu"),
            Post(id: 2, userId:7, title: "lorem", body: "lorem impu"),
            Post(id: 3, userId:7, title: "lorem", body: "lorem impu"),
          ]
        )
      ]
    );

   

    tearDown((){
      mockUserBloc.close();
      mockPostBloc.close();
    });
    
  });
}
