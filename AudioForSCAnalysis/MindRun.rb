with_fx :whammy do
  live_loop :Breakbeat1 do
    use_bpm 120
    sample :loop_breakbeat,amp: dice(4), beat_stretch: 4, decay: dice(4)
    sleep 2
  end
end

with_fx :whammy do
  live_loop :Kicks do
    use_bpm 120
    sample :bd_ada,amp: dice(4)
    sleep [0.5,1,2].choose
  end
end

with_fx :flanger do
  live_loop :Kick2 do
    use_bpm 120
    sample :bd_808,amp: dice(5), beat_stretch: 1.5
    sleep [0.5,1,2].choose
  end
end

with_fx :ixi_techno do
  live_loop :Blipss do
    use_bpm 120
    sample :elec_blip,amp: dice(5) if spread(2,3).tick
    sleep 0.5
  end
end

with_fx :ixi_techno do
  live_loop :Blips2 do
    use_bpm 120
    sample :elec_blip2,amp: dice(5) if spread(2,3).tick
    sleep 0.5
  end
end







