# Knight Travails
A mini project for The Odin project's Full Stack Ruby On Rails path Ruby Programming section where we have to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way. Below is the an example of how the function will work.
```
    knight_moves([3,3],[4,3])
    => You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
```

## Notes
To create the required function we will need to implement breath first search to find the shortest path for the knight. Since the knight movement will be an unweighted graph. Below is the reference that is most helpful for me to create this function.  
https://www.youtube.com/watch?v=UvxV6y0k6Vk
1. First we need to create the adjacency lists / graph for the knight movements.
2. Second with that adjacency list / graph we can use it to create the knight_moves method.
    - First we need to create 4 array: The distances array to store the distance from the start, the path array to store the previous movement, the vertices array to store the current move and also a queue array for the BFS.
    - We will travel the graph with bfs where it can be pictured as a fire spreading on the graph, where on each step the fire on each vertex will spread to its neighbour or in this case the vertices that is connected to it. While we travel with bfs, we will also keep the distance and it's path in the corresponding array and later use it to show the result. 
3. After we have traveled the graph with bfs, we can check the path from start to the goal by checking the paths and vertices array. We can loop backward from the goal to the start to see the steps the knight took to reach it goal.
```
    current = goal
    history = []
    until current == start
      history.unshift current
      row = vertices.rindex {|vertix| vertix.include? current}
    
      col = vertices[row].rindex {|vertix| vertix == current}
      current = paths[row][col]
    end
    history.unshift start
```