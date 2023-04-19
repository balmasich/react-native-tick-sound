package com.ticksound;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import android.media.AudioAttributes;
import android.media.SoundPool;
import android.media.AudioManager;

import java.util.HashMap;
import java.util.Map;

import android.content.Context;

@ReactModule(name = TickSoundModule.NAME)
public class TickSoundModule extends ReactContextBaseJavaModule {
  public static final String NAME = "TickSound";
  SoundPool soundPool;
  int game_over;
  private ReactApplicationContext rContext;

  public TickSoundModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.rContext = reactContext;

    AudioAttributes
      audioAttributes
      = new AudioAttributes
      .Builder()
      .setUsage(
        AudioAttributes
          .USAGE_ASSISTANCE_SONIFICATION)
      .setContentType(
        AudioAttributes
          .CONTENT_TYPE_SONIFICATION)
      .build();
    soundPool
      = new SoundPool
      .Builder()
      .setMaxStreams(1)
      .setAudioAttributes(
        audioAttributes)
      .build();

    game_over
      = soundPool
      .load(
        this.rContext,
        R.raw.tag_sound,
        1);
  }

  @ReactMethod
  public void stopSound() {
    soundPool.stop(game_over);
  }

  @ReactMethod
  public void playSound(int rate) {
    soundPool.stop(game_over);
    soundPool.play(game_over, 1, 1, 0, 0, rate);
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }

}
