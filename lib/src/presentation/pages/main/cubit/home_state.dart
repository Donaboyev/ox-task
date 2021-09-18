part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default([]) List<Variations> products,
    @Default(0) int page,
    @Default(0) int totalCount,
    @Default(false) bool isFetchPaginationLoading,
  }) = _HomeState;
}
