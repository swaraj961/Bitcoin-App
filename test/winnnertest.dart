List<int> winningNumber = [12,6,34,22,41,9,35];

void main (){
  List<int> ticket1 =[45,2,9,18,12,33];
  List<int> ticket2 = [41,17,26,32,7,35];
  
  checkwinner(ticket2);
}

void checkwinner(List<int>ticketno){
for( int mynum in ticketno) {
for(int winner in winningNumber){
if(winner == mynum){
  print('winner is $mynum');
//   else {
//     print('no winner found');
  }
    
 }
}
}
