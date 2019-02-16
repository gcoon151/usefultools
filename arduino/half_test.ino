#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// On my ESP8266 12E the pin labeled D1 can be referred to by the GPIO number 5.
// Google image serach esp826 12E pinout for a full diagram
#define PIN 5


// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(60, PIN, NEO_GRB + NEO_KHZ800);

// IMPORTANT: To reduce NeoPixel burnout risk, add 1000 uF capacitor across
// pixel power leads, add 300 - 500 Ohm resistor on first pixel's data input
// and minimize distance between Arduino and first pixel.  Avoid connecting
// on a live circuit...if you must, connect GND first.

void setup() {
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif
  // End of trinket special code


  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
}

void loop() {
  // Some example procedures showing how to display to the pixels:
//  colorWipe(strip.Color(10, 0, 0), 50); // Red
//  colorWipe(strip.Color(0, 5, 0), 50); // Green
//  colorWipe(strip.Color(0, 0, 15), 50); // Blue
//  colorWipe(strip.Color(10, 10, 10), 50); // White RGBW


// Red light
strip.setPixelColor(6, 0, 0, 0);
strip.setPixelColor(7, 10, 0, 0);
strip.setPixelColor(3, 10, 0, 0);
strip.show();
delay(5000);
//Green Light
strip.setPixelColor(7, 0, 0, 0);
strip.setPixelColor(5, 0, 5, 0);
strip.setPixelColor(3, 0, 5, 0);
strip.show();
delay(5000);
// Yellow light
strip.setPixelColor(5, 0, 0, 0);
strip.setPixelColor(6, 20, 10, 0);
strip.setPixelColor(3, 20, 10, 0);
strip.show();
delay(5000);

}

// Fill the dots one after the other with a color
//void colorWipe(uint32_t c, uint8_t wait) {
//  for(uint16_t i=0; i<strip.numPixels(); i++) {
//    strip.setPixelColor(i, c);
//    strip.show();
//    delay(wait);
//  }
//}


