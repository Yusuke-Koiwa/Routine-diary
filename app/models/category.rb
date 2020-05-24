class Category < ActiveHash::Base
  
  self.data = [
    {id: 0, name: "選択なし", icon: "minus"}, {id: 1, name: "勉強", icon: "pencil-alt"}, {id: 2, name: "読書", icon: "book-open"},
    {id: 3, name: "食生活", icon: "utensils"}, {id: 4, name: "睡眠", icon: "bed"}, {id: 5, name: "運動", icon: "running"},
    {id: 6, name: "健康", icon: "heart"}, {id: 7, name: "思考", icon: "brain"}, {id: 8, name: "お金", icon: "coins"}
  ]

end