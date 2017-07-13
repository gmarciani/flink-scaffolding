/*
  The MIT License (MIT)

  Copyright (c) 2017 Giacomo Marciani

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:


  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.


  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
 */
package com.gmarciani.flink_scaffolding.query2.operator;

import com.gmarciani.flink_scaffolding.query2.TopologyQuery2;
import com.gmarciani.flink_scaffolding.query2.tuple.TimedWord;
import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Parses a record as a {@link TimedWord}.
 * Used in {@link TopologyQuery2}.
 * @author Giacomo Marciani {@literal <gmarciani@acm.org>}
 * @since 1.0
 */
public class TimedWordParser implements FlatMapFunction<String,TimedWord> {

  /**
   * The logger.
   */
  private static final Logger LOG = LoggerFactory.getLogger(TimedWordParser.class);

  /**
   * The core method of the FlatMapFunction. Takes an element from the input data set and transforms
   * it into zero, one, or more elements.
   *
   * @param value The input value.
   * @param out   The collector for returning result values.
   * @throws Exception This method may throw exceptions. Throwing an exception will cause the operation
   *                   to fail and may trigger recovery.
   */
  @Override
  public void flatMap(String value, Collector<TimedWord> out) throws Exception {
    String parts[] = value.split(",");
    long timestamp = Long.valueOf(parts[0]);
    String word = parts[1].trim().toLowerCase();

    TimedWord parsed = new TimedWord(timestamp, word);

    LOG.debug("PARSED: {}", parsed);

    out.collect(parsed);
  }
}
