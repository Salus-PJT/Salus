import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Exercise from './navigation/Exercise';
import Home from './navigation/Home';
import * as React from 'react';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen
          name="Home"
          component={Home}
          options={{
            headerShown: false,
          }}
        />
        <Stack.Screen name="Exercise" component={Exercise} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
