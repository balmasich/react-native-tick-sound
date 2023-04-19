import React, { useEffect } from 'react';

import { StyleSheet, View } from 'react-native';
import { playSound, stopSound, TIMER } from 'react-native-tick-sound';

let id: ReturnType<typeof setInterval> | null = null;

export default function App() {
  useEffect(() => {
    id = setInterval(() => {
      playSound();
    }, TIMER.MAX);
    return () => {
      id !== null && clearInterval(id);
      id = null;
      stopSound();
    };
  }, []);

  return <View style={styles.container} />;
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
