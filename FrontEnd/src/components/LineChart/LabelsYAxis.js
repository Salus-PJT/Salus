import React from "react";

const LabelsYAxis = ({
  hg,
  FONT_SIZE,
  chartHeight,
  padding,
  maximumYFromData,
  precision,
  unit,
}) => {
  const PARTS = hg;
  return new Array(PARTS + 1).fill(0).map((_, index) => {
    const x = FONT_SIZE;
    const ratio = index / hg;

    const yCoordinate =
      chartHeight - chartHeight * ratio + padding + FONT_SIZE / 2;
    return (
      <text
        key={index}
        x={x - 3}
        y={yCoordinate}
        style={{
          fill: "#808080",
          fontSize: FONT_SIZE - 2,
          fontFamily: "Helvetica",
        }}
      >
        {parseFloat(maximumYFromData * (index / PARTS)).toFixed(precision)}{" "}
        {unit}
      </text>
    );
  });
};
export default LabelsYAxis;
