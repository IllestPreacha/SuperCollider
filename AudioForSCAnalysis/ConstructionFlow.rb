
live_loop :dancing do
  use_bpm 120
  with_fx :flanger,decay: 4, amp: 3, feedback: 0.7, mix: 0.7 do
    sample :perc_swoosh if spread(8,12).tick
    sample :elec_bong if spread(7,12).tick
  end
  sleep [0.25,0.5,0.75,1].choose
end

live_loop :snapping do
  use_bpm 120
  with_fx :bitcrusher do
    sample :perc_snap2, beat_stretch: 2 if spread(6,12).tick
    sample :bd_ada, beat_stretch: dice(2) if spread(5,12).tick
  end
  sleep [1,2,4].choose
end

live_loop :electronic do
  use_bpm 120
  with_fx [:whammy,:ixi_techno].choose do
    sample :elec_blip, amp: dice(4), beat_stretch: dice(2) if spread(3,5).tick
  end
  sleep 0.5
end