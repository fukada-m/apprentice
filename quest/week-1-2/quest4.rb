# 底辺が x cm、高さが y cmの三角形の面積を出力する関数 area 
def area(x,y)
    # 1 <= x, y <= 100の条件がある
    if 1 <= x && y <= 100
        return x * y /2
    end
end

puts area(5,4)