final Map<String,List<String>> graph = {
  "A":["B","C"],
  "B":["D","E","F"],
  "C":["G"],
  "D":[],
  "E":[],
  "F":["H"],
  "G":["I"],
  "H":[],
  "I":[]
};

bool bfs({required Map<String,List<String>> graph, required init, required target}){
  List queue = [];
  List queue_visited = [];
  
  queue_visited.add(init);
  
  if(graph[init] != null){
    graph[init]!.forEach((key){
      queue.add(key);
    });
  }

  while(queue.isNotEmpty){
    final whoIsCheck = queue.first;
    queue_visited.add(whoIsCheck);
    queue.remove(whoIsCheck);

    if(whoIsCheck == target || !queue_visited.contains(whoIsCheck)){
      return true;
    }else{
      graph[whoIsCheck]?.forEach((key)=>queue.add(key));
    }
  }
  return false;
}



int main(){
  final result = bfs(graph: graph, init: "A", target: "Z");
  print(result);
  return 0;
}
