import 'model.dart';
import 'actions.dart';

 AppState appStateReducer(AppState state,action){
   return AppState(
       items: itemReducer(state.items, action));
 }

 List<Item> itemReducer(List<Item> state, action){
   if(action is AddItemAction){
     return []..addAll(state)
              ..add(new Item(id: action.id, body: action.item));
   }

   if(action is RemoveItemAction){
     return List.unmodifiable(List.from(state))..remove(action.item);
   }

   if(action is RemoveItemsAction){
     return List.unmodifiable([]);
   }
   return state;
 }