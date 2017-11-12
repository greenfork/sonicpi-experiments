use_bpm 120

live_loop :pulses do
  
  use_synth :chiplead
  with_fx :lpf, cutoff: 100 do
    with_fx :gverb do
      with_fx :hpf do
        3.times do
          play_chord [68, 68.1], pan: 0.2
          sleep 1
        end
        play_chord [68, 68.1], pan: -0.5
        sleep 0.5
        play_chord [68, 68.1], pan: 0.5
        sleep 0.5
        
        4.times do
          play_chord [68, 73, 73.1], pan: -0.2
          sleep 1
        end
        
        4.times do
          play_chord [68, 72, 72.1], pan: 0.2
          sleep 1
        end
        
        4.times do
          play_chord [68, 56, 56.1], pan: -0.2
          sleep 1
        end
      end
    end
  end
end

live_loop :beat, sync: :pulses do
  with_fx :panslicer, pulse_width: 0.25, pan_max: 0.3, pan_min: -0.3 do
    8.times do
      sample :drum_cymbal_soft, amp: 0.6
      sleep 1
    end
  end
end

live_loop :bo4ka, sync: :pulses, delay: 16 do
  with_fx :reverb, room: 0.6 do
    sample :bd_haus, rate: 0.8, amp: 1.5
    sleep 1
  end
end

live_loop :bass, sync: :pulses, delay: 32 do
  stop
  finish = 0.7
  sound = :bass_voxy_c
  with_fx :wobble, phase: 1, cutoff_max: 50, amp: 1 do
    sample sound, finish: finish, pitch: -4
    sleep 4
    sample sound, finish: finish, pitch: 1
    sleep 4
    sample sound, finish: finish
    sleep 4
    sample sound, finish: finish, pitch: -4
    sleep 4
  end
end
