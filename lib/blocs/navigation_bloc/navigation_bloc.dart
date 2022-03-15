import 'package:bloc/bloc.dart';
import 'package:file_structure_flutter/pages/tickets_pages/tickets_page/ticket_page.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<NavigateMenu>((event, emit) {
      emit(
        state.copyWith(
          status: NavigationStateStatus.menu,
          currentIndex: event.menuIndex,
          route: event.route,
        ),
      );
    });

    on<NavigateTab>((event, emit) {
      emit(
        state.copyWith(
          status: NavigationStateStatus.tab,
          currentIndex: event.tabIndex,
          route: event.route,
        ),
      );
    });
  }
}
