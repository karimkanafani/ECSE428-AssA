Feature: Video call with other students

As a student,
I want to be able to video call with other students,
so that we can visually collaborate.

Background: 
  Given the student is logged in using their account

  # Normal Flow
Scenario Outline: A student video calls another student
    Given the student selected the relevant student recipient of the video call
    And the student recipient of the video call is online and available
    When the student clicks on the 'video call' button
    Then the student on the receiving will have the chance to accept
    And have a real time video and voice conversation with the caller

    # Alternate Flow
Scenario Outline: A student video calls his group
  Given the student has selected the relevant group recipient of the video call
  When the student clicks on the 'video call' button
  Then the online recipients in the called group will have the chance to accept
  And have a real time group video and voice conversation with the caller

  # Error Flow
  Scenario Outline: A student calls an offline recipient
    Given the student has selected the offline recipient of the call
    When the student clicks on the 'video call' button
    Then an error 'Student is offline' will be returned to the caller
