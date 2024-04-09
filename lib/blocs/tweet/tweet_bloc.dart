import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngetweet/models/tweet_model.dart';
import 'package:ngetweet/services/tweet_service.dart';

part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  TweetBloc() : super(TweetInitial()) {
    on<TweetEvent>((event, emit) async {
      if (event is TwettGet) {
        try {
          emit(TweetLoading());

          final tweet = await TweetService().getTweet();

          emit(TweetSuccess(tweet));
        } catch (e) {
          emit(TweetFailed(e.toString()));
        }
      }

      if (event is TwettGetAll) {
        try {
          emit(TweetLoading());

          final tweet = await TweetService().getAllTweet();

          emit(TweetSuccess(tweet));
        } catch (e) {
          emit(TweetFailed(e.toString()));
        }
      }

      // if (event is TweetAdd) {
      //   try {
      //     emit(TweetLoading());

      //     final tweet = await TweetService().addTweet(event.body, event.image);

      //     emit(const TweetSuccess());
      //   } catch (e) {
      //     emit(TweetFailed(e.toString()));
      //   }
      // }
    });
  }
}
