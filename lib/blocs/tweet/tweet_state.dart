part of 'tweet_bloc.dart';

sealed class TweetState extends Equatable {
  const TweetState();

  @override
  List<Object> get props => [];
}

final class TweetInitial extends TweetState {}

final class TweetLoading extends TweetState {}

final class TweetFailed extends TweetState {
  final String e;
  const TweetFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class TweetSuccess extends TweetState {
  final List<Tweet> tweet;
  const TweetSuccess(this.tweet);

  @override
  List<Object> get props => [tweet];
}
