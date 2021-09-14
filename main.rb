class Knight
  attr_reader :move_graph
  def initialize board
    @moves = [[1,-2], [2,-1], [2,1], [1,2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
    @move_graph = board.map.with_index do |row, row_idx|
      row.map.with_index do |col, col_idx|
        possible_moves = @moves.map do |move|
          row_coor = row_idx + move[0]
          col_coor = col_idx + move[1]
          if row_coor >= 0 && row_coor < 8 &&  col_coor >= 0 && col_coor < 8 
            [row_coor, col_coor]
          end
        end
        possible_moves.compact
      end
    end
  end

  
end

class ChessBoard
  attr_reader :knight
  def initialize
    @board = [
      ['8a', '8b', '8c', '8d', '8e', '8f', '8g', '8h'],
      ['7a', '7b', '7c', '7d', '7e', '7f', '7g', '7h'],
      ['6a', '6b', '6c', '6d', '6e', '6f', '6g', '6h'],
      ['5a', '5b', '5c', '5d', '5e', '5f', '5g', '5h'],
      ['4a', '4b', '4c', '4d', '4e', '4f', '4g', '4h'],
      ['3a', '3b', '3c', '3d', '3e', '3f', '3g', '3h'],
      ['2a', '2b', '2c', '2d', '2e', '2f', '2g', '2h'],
      ['1a', '1b', '1c', '1d', '1e', '1f', '1g', '1h'],
    ]
    @knight = Knight.new @board
  end
end

def main 
  chessboard = ChessBoard.new
  p chessboard.knight.move_graph[7][7]
end

main
