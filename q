
[1mFrom:[0m /home/ricecake88/sinatra-restful-routes-lab-v-000/spec/sinatra_restful_routes_lab_spec.rb @ line 113 :

    [1;34m108[0m:         [31m[1;31m"[0m[31mingredients[1;31m"[0m[31m[0m => [31m[1;31m"[0m[31mpumpkin, flour, butter, sugar[1;31m"[0m[31m[0m,
    [1;34m109[0m:         [31m[1;31m"[0m[31mcook_time[1;31m"[0m[31m[0m => [31m[1;31m"[0m[31m1 hour[1;31m"[0m[31m[0m
    [1;34m110[0m:       }
    [1;34m111[0m:       
    [1;34m112[0m:       post [31m[1;31m'[0m[31m/recipes[1;31m'[0m[31m[0m, params
 => [1;34m113[0m:       binding.pry
    [1;34m114[0m:       follow_redirect!
    [1;34m115[0m:     [32mend[0m
    [1;34m116[0m:     it [31m[1;31m"[0m[31mcreates a new recipe and saves to the database[1;31m"[0m[31m[0m [32mdo[0m 
    [1;34m117[0m:       expect([1;34;4mRecipe[0m.all.count).to eq([1;34m3[0m)
    [1;34m118[0m:       expect([1;34;4mRecipe[0m.last.name).to eq([31m[1;31m"[0m[31mpumpkin pie[1;31m"[0m[31m[0m)

