# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)c
categories = MainCategory.create([
{ name: 'Seats' },
{ name: 'Beds' },
{ name: 'Tables' },
{ name: 'Storage' },
{ name: 'Other Furniture' }
])

# sub_categories1 = SubCategory.create([
#     { main_category_id: 1, name: 'sofas' },
#     { main_category_id: 1, name: 'sofa beds' },
#     { main_category_id: 1, name: 'armchairs' },
#     { main_category_id: 1, name: 'benches' },  
#     { main_category_id: 1, name: 'chairs' },
#     { main_category_id: 1, name: 'bar chairs' },   
#     { main_category_id: 1, name: 'seats' },           
#     { main_category_id: 1, name: 'stools' }
#     ])

    # sub_categories2 = SubCategory.create([
    #     { main_category_id: 2, name: 'beds' },
    #     { main_category_id: 2, name: 'mattresses' },
    #     { main_category_id: 2, name: 'cots' },
    #     { main_category_id: 2, name: 'cribs' },  
    #     { main_category_id: 2, name: 'operating tables' }
    #     ])

    # sub_categories3 = SubCategory.create([
    # { main_category_id: 3, name: 'dining tables' },
    # { main_category_id: 3, name: 'desks' },
    # { main_category_id: 3, name: 'counters' },
    # { main_category_id: 3, name: 'lecterns' },  
    # { main_category_id: 3, name: 'serving trolleys' },
    # { main_category_id: 3, name: 'sports tables' },             
    # { main_category_id: 3, name: 'tables' }
    # ])

    # sub_categories4 = SubCategory.create([
    # { main_category_id: 4, name: 'bookcases' },
    # { main_category_id: 4, name: 'cabinets' },
    # { main_category_id: 4, name: 'chests' },
    # { main_category_id: 4, name: 'drawers' },        
    # { main_category_id: 4, name: 'shelves' },  
    # { main_category_id: 4, name: 'show-cases' },             
    # { main_category_id: 4, name: 'wardrobes' }
    # ])

    # sub_categories5 = SubCategory.create([
    # { main_category_id: 5, name: 'booths' },
    # { main_category_id: 5, name: 'coat racks' },
    # { main_category_id: 5, name: 'mirrors' },
    # { main_category_id: 5, name: 'playpens' },                     
    # { main_category_id: 5, name: 'others' }
    # ])

    states = State.create([
    { name: 'ACT' },
    { name: 'NSW' },
    { name: 'NT' },
    { name: 'QLD' },
    { name: 'SA' },
    { name: 'TAS' },
    { name: 'VIC' },
    { name: 'WA' } 
    ])