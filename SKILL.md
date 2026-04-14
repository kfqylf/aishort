---
name: stock-short-term-quant
description: >-
  Frames short-horizon equity analysis with quant-style indicators (trend,
  momentum, volume, volatility, intraday context) plus AI synthesis of
  conflicting signals. Use for US or specified-market swing/day-trade
  brainstorming, signal review, or research notes—not live execution, not
  guaranteed forecasts. Triggers: 短线, 日内, 波段, 量化, 技术指标, RSI, MACD,
  VWAP, ATR, 成交量, 美股 ticker, 结合 AI 解读.
---

# Short-term stock view: quant + AI (research only)

## Mandatory disclaimer (always first)

State clearly in the user-visible answer:

- This is **educational research framing**, not investment, tax, or legal advice.  
- Short-term trading has **high variance**; past patterns do not guarantee future price.  
- The agent **does not** place trades, access brokerage accounts, or verify real-time fills.

If the user asks for guaranteed returns, all-in sizing, or “sure win” language: refuse and restate the disclaimer.

---

## Data rules

1. Prefer **fresh** prices and corporate events: **web search**, user-provided exports, or a configured **finance MCP/API**.  
2. Label the **as-of timestamp** (date, timezone if intraday).  
3. If data is missing, say so. **Do not fabricate** OHLCV, spreads, or borrow rates.

---

## Indicator set (default “quant + technician” stack)

Use these as **building blocks**, not magic formulas. Combine **2–4** max in a single narrative to avoid overfitting theater.

| Bucket | Examples | What it answers |
|--------|----------|-----------------|
| Trend | EMA 20 / 50 / 200, structure (HH/HL) | Dominant direction on the chosen horizon |
| Momentum | RSI(14), MACD histogram | Overextension vs continuation caveats |
| Volume | Rel volume vs 20D avg, OBV or simple volume surge | Participation confirming or diverging from price |
| Volatility | ATR(14), Bollinger width | Stop distance and event risk scaling |
| Intraday | VWAP, opening range | Mean-reversion vs trend day framing |

**Interpretation rules**

- Treat **divergence** (price vs RSI or vs volume) as **hypothesis**, not a trigger by itself.  
- **Regime filter**: note broad market (index/sector ETF same day) when discussing single names.  
- **Event wall**: earnings, FDA, Fed within N days increases model uncertainty; widen scenarios, shrink confidence language.

---

## AI’s job (what “AI + quant” means here)

1. **Synthesize** indicators that **disagree** (e.g., trend up but momentum overbought) into **scenarios** (A/B/C) with invalidation levels described as “if broken, the story weakens”, not “will reverse”.  
2. **Surface risks**: liquidity, gap risk, borrow, single-customer names, forex if ADR.  
3. **Propose checks**: “confirm with closing print”, “wait for volume”, “define max loss in dollars before entry”.  
4. **Never** output trade orders sized for the user without their account size, risk tolerance, and horizon.

---

## Output shape (concise default)

1. **Snapshot**: ticker, price context, as-of time.  
2. **Indicator table**: 3–5 rows, each with **reading + caveat**.  
3. **Scenarios**: bull / base / bear with **what evidence would shift** the weighting.  
4. **Risk block**: 3–5 bullets.  
5. **One-line non-advice** repeat at the end.

For **intraday** explicitly, prepend VWAP and opening range before slower EMAs.

---

## Anti-patterns

- Single-indicator conviction (“RSI < 30 so buy”).  
- Mixing **unadjusted** prices with **split** corporate actions without noting adjustments.  
- Backtest cherry-picking without sample period and survivorship caveats.  
- Using **中文喊单体** (“必涨”, “满仓”) in any language.

---

## Optional tooling note

If the user runs local notebooks (Python/R) for signals, prefer **reproducible** seeds and pinned library versions; the skill does not require a specific stack. For **Cursor-only** sessions, stay at interpretation layer unless the user opens a repo and asks for implementation.

---

## Related public inspiration (not affiliated)

Educational multi-agent finance exploration: [virattt/ai-hedge-fund](https://github.com/virattt/ai-hedge-fund). This skill is **independent** and optimized for **short-horizon indicator + AI synthesis** in chat, not for running that codebase.
