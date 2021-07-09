use_bpm 65

define :chord_player_dom7 do |root, repeats|
  repeats.times do
    play chord(root, :dom7), release: 0.7
    sleep 1
  end
end

define :reed_player_dom7 do |root, repeats|
  repeats.times do
    play chord(root, :dom7), release: 2.7, cutoff: 90, amp: 0.3
    sleep 1
  end
end


define :lead_player do
  temprng = [0.25,0.5,1].choose
  use_synth :pluck
  play choose(scale(:c4, :blues_minor)), release: temprng
  sleep temprng
  
  
end




live_loop :bluesbkt do
  use_synth :tri
  reed_player_dom7 :c3, 4
  reed_player_dom7 :f3, 4
  reed_player_dom7 :c3, 8
  reed_player_dom7 :f3, 8
  reed_player_dom7 :c3, 8
  reed_player_dom7 :g3, 4
  reed_player_dom7 :f3, 4
  reed_player_dom7 :c3, 4
  reed_player_dom7 :g3, 4
end

live_loop :bluesbkt2 do
  use_synth :piano
  chord_player_dom7 :c4, 4
  chord_player_dom7 :f4, 4
  chord_player_dom7 :c4, 8
  chord_player_dom7 :f4, 8
  chord_player_dom7 :c4, 8
  chord_player_dom7 :g4, 4
  chord_player_dom7 :f4, 4
  chord_player_dom7 :c4, 4
  chord_player_dom7 :g4, 4
end


live_loop :lead do
  
  lead_player
end

