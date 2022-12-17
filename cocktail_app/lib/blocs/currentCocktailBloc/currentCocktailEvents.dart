class CurrentCocktailEvent {}

class SetCurrentCocktailEvent extends CurrentCocktailEvent {
  final String id;
  SetCurrentCocktailEvent(this.id);
}