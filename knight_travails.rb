require 'set'

def knight_moves(start, goal)
  parent = {}
  used = Set[start]
  search = Queue.new([start])
  ds = [[2,1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
  max_x, max_y = 7, 7
  while search.length > 0 do
    move = search.pop
    if move == goal then
      break
    end
    for d in ds do
      new_move = [move[0]+d[0], move[1]+d[1]]
      in_y = new_move[0] <= max_y && new_move[0] >= 0
      in_x = new_move[1] <= max_x && new_move[1] >= 0
      not_repeat = !used.include?(new_move)
      if in_y && in_x && not_repeat then
        search.push(new_move)
        used.add(new_move)
        parent[new_move] = move
      end
    end
  end
  ans = [goal]
  place = goal
  while place != start do
    ans.push(parent[place])
    place = parent[place]
  end
  ans = ans.reverse
  return ans
end

p knight_moves([3,3], [4,3])
p knight_moves([0,0], [3,3])
p knight_moves([3,3], [0,0])
p knight_moves([0,0], [7,7])