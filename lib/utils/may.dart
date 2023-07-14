import 'package:bloc/bloc.dart';
import 'package:abushakir/abushakir.dart';
import 'calander_state.dart';
import 'calander_event.dart';
import 'calander.dart';

// import 'package:ethcalander/blocs/calendar/calendar.dart';
// import 'package:ethcalander/blocs/calendar/calendar_event.dart';
// import 'package:ethcalander/blocs/calendar/calendar_state.dart';
// import 'p';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final ETC currentMoment;
  CalendarBloc({required this.currentMoment}) : super(Month(currentMoment));
  @override
  CalendarState get initialState => Month(currentMoment);
  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    if (event is NextMonthCalendar){
      yield* _getNextMonth(event);
    }else if(event is PrevMonthCalendar){
      yield* _getPreviousMonth(event);
    }
  }

  Stream<CalendarState> _getNextMonth(NextMonthCalendar nmCal) async* {
    yield Month(nmCal.currentMonth.nextMonth);
  }

  Stream<CalendarState> _getPreviousMonth(PrevMonthCalendar pmCal) async* {
    yield Month(pmCal.currentMonth.prevMonth);
  }

}


