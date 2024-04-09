part of 'tweet_bloc.dart';

sealed class TweetEvent extends Equatable {
  const TweetEvent();

  @override
  List<Object> get props => [];
}

class TwettGet extends TweetEvent {}

class TwettGetAll extends TweetEvent {}

class TweetAdd extends TweetEvent {
  final String body;
  final String image;
  const TweetAdd(this.body, this.image);

  @override
  List<Object> get props => [body, image];
}

class TweetDelete extends TweetEvent {
  final String id;
  const TweetDelete(this.id);

  @override
  List<Object> get props => [id];
}
