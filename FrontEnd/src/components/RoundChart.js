import React from 'react';
import styled from 'styled-components';

const Circle = styled.circle`
  animation: circle-fill-animation 2s ease;
  stroke-linecap: round;
  stroke-dashoffset: ${(props) => -2 * Math.PI * 90 * (1 - props.roundRatio)};

  @keyframes circle-fill-animation {
    0% {
      stroke-dashoffset: -${2 * Math.PI * 90};
    }
  }
`;

const Div = styled.div`
  width: ${(props) => (props.roundWidth ? (props.roundWidth / 1080) * 100 + 'vw' : '180px')};
  height: ${(props) => (props.roundHeight ? (props.roundHeight / 1920) * 100 + 'vh' : '180px')};
  position: relative;
`;
const TextDiv = styled.div`
  position: absolute;
  width: 180px;
  height: 180px;
  top: ${(props) => (props.textTop ? props.textTop : '0px')};
  left: ${(props) => (props.textLeft ? props.textLeft : '0px')};
`;
const Svg = styled.svg`
  transform: rotate(-90deg);
`;

const RoundChart = ({
  roundRatio = 1,
  roundWidth = 180,
  roundHeight = 180,
  colorGradient,
  textTop = '35px',
  textLeft = '0px',
  children,
  KEY,
}) => {
  return (
    <Div roundHeight={roundHeight} roundWidth={roundWidth}>
      <TextDiv textTop={textTop} textLeft={textLeft}>
        {children}
      </TextDiv>
      <Svg viewBox="0 0 200 200">
        <linearGradient id={`linearColors${KEY}`} x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor={colorGradient[0]}></stop>
          <stop offset="50%" stopColor={colorGradient[1]}></stop>
          <stop offset="100%" stopColor={colorGradient[2]}></stop>
        </linearGradient>
        <circle cx="100" cy="100" r="90" fill="none" strokeWidth="10" stroke="#EDEEF4" />
        <Circle
          cx="100"
          cy="100"
          r="90"
          fill="none"
          strokeWidth="10"
          stroke={`url(#linearColors${KEY})`}
          strokeDasharray={`${2 * Math.PI * 90 * 1}`}
          roundRatio={roundRatio}
        />
      </Svg>
    </Div>
  );
};

export default RoundChart;
