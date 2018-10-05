function [ ps ] = gen_ps( bound )

ps = [];
base_ps = [0.5 0.2 0.1];

while base_ps(3) >= bound
   ps = [ ps base_ps ];
   base_ps = base_ps / 10.0;
end

end

