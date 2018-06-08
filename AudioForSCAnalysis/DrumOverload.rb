live_loop :trapHats do
  density (ring, 4, 6, 8, 16).tick do
    sample :bd_fat
    sleep 1
  end
end

t = 1.0

live_loop :trapHats1 do
  sample :bd_808, amp: 10
  sleep (knit, t/4, 4, t/6, 6, t/8, 8, t/16, 8, t/4, 2).tick
end

live_loop :drums do
  
  with_fx :ixi_techno do
    sample :drum_heavy_kick
    sleep 1
  end
  
  with_fx :echo do
    sample :drum_snare_hard
    sleep 1
  end
  
  with_fx :flanger do
    sample :drum_heavy_kick
    sleep 1
  end
  with_fx :octaver do
    sample :drum_snare_hard
    sleep 1
  end
  
end

with_fx :eq do
  live_loop :hihat do
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_cymbal_pedal
    sleep 1
  end
end
