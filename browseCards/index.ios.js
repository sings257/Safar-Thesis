/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */


import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Image,
  ScrollView,
  StatusBar,
  Navigator,
  TouchableHighlight,
  View,
  TabBarIOS,
  Button
} from 'react-native';

// import { StyleProvider } from '@shoutem/theme';
// import {
//   Card,
//   Image,
//   Subtitle,
//   Caption,
// } from '@shoutem/ui';

import MaskedView from 'react-native-masked-view';


import {
  Card,
  CardTitle,
  CardImage,
  CardContent,
  CardAction
} from 'react-native-card-view';

export default class browseCard extends Component {

  state = {
    selectedTab: 'SEEK',
  };

  // _renderContent = (pageText : View) => {
  //   return (
  //
  //   );
  // };

  render() {
    return (
            <View style={styles.container}>
              <TabBarIOS
              unselectedTintColor="#AAAAAA"
              tintColor="#4D33D7">

              <TabBarIOS.Item
                title ="SEEK"
                selected={this.state.selectedTab === 'SEEK'}
                onPress={() => {this.setState({selectedTab: 'SEEK'});}}>


                <ScrollView horizontal={true} vertical={false}>
                  <Card
                    styles={{card: {
                      width: 300,
                      height: 155,
                      position: 'absolute',
                      marginTop: 449,
                      marginBottom: 63,
                      marginLeft: 38,
                      borderRadius: 12,
                      shadowColor: '#000000',
                      shadowOpacity: 0.2,
                      shadowRadius: 4,
                      shadowOffset:{
                        height: 2,
                        width: 0
                      }
                    }}}>
                      <View style={styles.crowded}>
                      <Image source={require('./assets/not_crowded.png')}
                      />
                      </View>
                      <CardTitle>
                        <Text style={styles.title}>{'   Blue Bottle Coffee'.toUpperCase()}</Text>
                      </CardTitle>
                      <CardContent>
                        <Text style={styles.Subtitle}>
                          <Text style={{fontWeight: 'bold'}}>35 </Text>
                          <Text>Points when you check-in</Text>
                        </Text>
                        <Text style={styles.Subtitle2}>0.5 mi</Text>
                      </CardContent>
                      <CardImage>
                        <Image
                          style={styles.img}
                          source={require('./assets/blue-bottle-coffee.jpg')}
                        />
                      </CardImage>
                  </Card>
                  <Card
                    styles={{card: {
                      width: 300,
                      height: 155,
                      position: 'relative',
                      marginTop: 449,
                      marginBottom: 63,
                      marginLeft: 351,
                      borderRadius: 12,
                      shadowColor: '#000000',
                      shadowOpacity: 0.2,
                      shadowRadius: 4,
                      shadowOffset:{
                        height: 2,
                        width: 0
                      }
                    }}}>
                      <View style={styles.crowded}>
                      <Image source={require('./assets/mildly_crowded.png')}
                      />
                      </View>
                      <CardTitle>
                        <Text style={styles.title}>{'Think Coffee'.toUpperCase()}</Text>
                      </CardTitle>
                      <CardContent>
                        <Text style={styles.Subtitle}>
                          <Text style={{fontWeight: 'bold'}}>35 </Text>
                          <Text>Points when you check-in</Text>
                        </Text>
                        <Text style={styles.Subtitle2}>1.1 mi</Text>
                      </CardContent>
                      <CardImage>
                      <Image
                        style={styles.img}
                        source={require('./assets/think_coffee1.jpg')}/>
                      </CardImage>
                  </Card>
                  <Card
                    styles={{card: {
                      width: 300,
                      height: 155,
                      position: 'relative',
                      marginTop: 449,
                      marginBottom: 63,
                      marginLeft: 8,
                      marginRight: 38,
                      borderRadius: 12,
                      shadowColor: '#000000',
                      shadowOpacity: 0.2,
                      shadowRadius: 4,
                      shadowOffset:{
                        height: 2,
                        width: 0
                      }
                    }}}>
                      <View style={styles.crowded}>
                      <Image source={require('./assets/overcrowded.png')}
                      />
                      </View>
                      <CardTitle>
                        <Text style={styles.title}>{'Birch Coffee'.toUpperCase()}</Text>
                      </CardTitle>
                      <CardContent>
                        <Text style={styles.Subtitle}>
                          <Text style={{fontWeight: 'bold'}}>30 </Text>
                          <Text>Points when you check-in</Text>
                        </Text>
                        <Text style={styles.Subtitle2}>1.3 mi</Text>
                      </CardContent>
                      <CardImage>
                      <Image
                        style={styles.img}
                        source={require('./assets/birch.jpg')}/>
                      </CardImage>
                  </Card>
                </ScrollView>
              </TabBarIOS.Item>
              <TabBarIOS.Item
                title="MY PLACES"
                selected={this.state.selectedTab === 'MYPLACES'}
                onPress={() => {
                  this.setState({
                    selectedTab: 'MYPLACES',
                  });
                }}>
                <View>
                <Text style={styles.tabText}>Hello</Text>
                </View>
              </TabBarIOS.Item>
            </TabBarIOS>
            </View>


   );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    left: 0
  },
  crowded:{
    marginTop: 10,
    marginLeft: 12,
    marginRight: 150
  },
  title: {
    fontSize: 12,
    fontFamily: 'Montserrat-Regular',
    letterSpacing: 0.86,
    marginLeft: -136,
    marginTop: -6,
    backgroundColor: 'transparent'
  },
  Subtitle: {
    fontSize: 10,
    color: '#7D7B7B',
    fontFamily: 'Avenir',
    fontWeight: '400',
    backgroundColor: 'transparent',
    marginLeft: -4,
    marginTop: -56
  },
  Subtitle2: {
    fontSize: 10,
    color: '#7D7B7B',
    fontFamily: 'Avenir',
    fontWeight: '400',
    backgroundColor: 'transparent',
    marginLeft: 237,
    marginTop: -12,
    textAlign: 'right'
  },
  card: {
    width: 300,
    height: 155.5
  },
  img: {
    width: 300,
    height: 86.5,
    marginTop: -50,
    borderWidth: 0,
    borderRadius: 12
  },
  tabContent: {
   flex: 1,
   alignItems: 'center',
 },
 tabText: {
   color: 'black',
   margin: 50,
 },
 tabBarButtons: {
    fontFamily: 'Montserrat-Bold',
    fontSize: 11,
    color: '#AAAAAA',
    letterSpacing: 1,
    flexDirection:'column',
    marginLeft: 26,
    marginRight: 20,
  },
  tab: {
    bottom: 0,
    position: "absolute",
    height: 54,
    flexWrap: 'wrap',
    alignItems: 'center',
    flexDirection:'row',
    width: 375,
    borderColor: '#DDDDDD',
    borderStyle: 'solid',
    borderWidth: 1,
    backgroundColor: '#FFFFFF',

  }
});

AppRegistry.registerComponent('browseCard', () => browseCard);
