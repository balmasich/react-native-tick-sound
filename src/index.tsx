import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-tick-sound' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const TickSound = NativeModules.TickSound
  ? NativeModules.TickSound
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export const TIMER = {
  MIN: 120,
  MAX: 1000,
} as const;

export const playSound = (rate: number = 1) => {
  TickSound.stopSound();
  TickSound.playSound(rate);
};
export const stopSound = () => {
  TickSound.stopSound();
};
