# spatial-audio

This project was done as part of DSP Course Mini Project - April 2016.  

The objective of this project is to spatially localize the direction of the sound’s source by just listening to a processed single channel mono audio recording being played on a pair of stereo headphones or stereo loudspeakers.  

Using available mathematical models for the head and various other body parts we build our filter which gives audio output with spatial effects. The models are chosen to account for azimuthal, elevation, range variations and room reverberations. For azimuthal variation we include the head shadow filter and inter aural time delay filters. In order to incorporate elevation changes we use pinna and shoulder filter. The room reverberation is achieved by just controlling the echo intensity and time delay filter. The output of all these filters put together drives the headphone output.  

The output of all the above filters must be further processed before driving the loudspeakers. A technique called crosstalk cancellation is used in order to nullify the effect of the farther channel at each ear. A combination of head shadow filter, time delay filter and comb filter with a low pass filter in the feedback loop is used to implement this technique. On passing binaural signals through this combination we get signals which can drive the loudspeaker and ensure that the spatial effects remain intact.  

With this project we aim to show that instead of using HRTFs which require high operational costs and storage costs, using the concept of modelling the human parts responsible for affecting waves from source to ears is more elegant and suitable for real time applications. Also this can be made to suit any person by just changing a few parameters in the model. With this approach we can create a easily personalisable spatial audio environment using headphones and loudspeakers.

For a quick demo, launch the [GUI](gui/run.fig) in Matlab environment and enjoy!

### Contributors

Akarsh Prabhakara
