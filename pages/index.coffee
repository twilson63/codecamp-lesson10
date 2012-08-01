div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Lesson 11'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
      h3 'Final Lesson'
    section ->
      h1 'Review'
      ul ->
        li -> a href: '/exercise1.html', 'Exercise1'
        li -> a href: '/exercise2.html', 'Exercise2'
        li -> a href: '/exercise3.html', 'Exercise3'
        li -> a href: '/exercise4.html', 'Exercise4'
        li -> a href: '/exercise5.html', 'Exercise5'
        li -> a href: '/exercise6.html', 'Exercise6'

  aside '.controls', ->
    a '.left', href: '#', '&#x25C4;'
    a '.right', href: '#', '&#x25BA;'
    a '.up', href: '#', '&#x25B2;'
    a '.down', href: '#', '&#x25BC;'
  comment 'Presentation progress bar'
  div '.progress', ->
    span()